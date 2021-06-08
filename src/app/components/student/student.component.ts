import { Component, ErrorHandler, Input, OnChanges, OnDestroy, OnInit, SimpleChanges, ViewChild } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Subscription } from 'rxjs';
import { Departman } from 'src/app/models/departman';
import { Status } from 'src/app/models/status';
import { Student } from 'src/app/models/student';
import { StudentService } from 'src/app/services/student.service';
import { StudentDialogComponent } from '../dialogs/student-dialog/student-dialog.component';

@Component({
  selector: 'app-student',
  templateUrl: './student.component.html',
  styleUrls: ['./student.component.css']
})
export class StudentComponent implements OnInit, OnDestroy, OnChanges {

  displayedColumns = ['id', 'ime', 'prezime', 'brojIndeksa', 'status', 'departman', 'actions'];
  dataSource: MatTableDataSource<Student>;
  @Input() selektovanDepartman: Departman;
  subscription: Subscription;

  @ViewChild(MatSort, {static: false}) sort: MatSort;
  @ViewChild(MatPaginator, {static: false}) paginator: MatPaginator;
  
  constructor(private studentService: StudentService,
              private dialog: MatDialog) { }

  ngOnChanges(): void {
    if(this.selektovanDepartman.id) {
      this.loadData();
    }
  }

  ngOnDestroy(): void {
    this.subscription.unsubscribe();
  }

  ngOnInit(): void {
   // this.loadData();
  }

  loadData() {
    this.subscription = this.studentService.getStudentiZaDepartman(this.selektovanDepartman.id).subscribe(
      data => {
        this.dataSource = new MatTableDataSource(data);
        this.dataSource.filterPredicate = (data, filter: string) => {
          const accumulator = (currentTerm, key) => {
            return key === 'status' ? currentTerm + data.status.naziv : currentTerm + data[key];
          };
          const dataStr = Object.keys(data).reduce(accumulator, '').toLowerCase();
          const transformedFilter = filter.trim().toLowerCase();
          return dataStr.indexOf(transformedFilter) !== -1;
        };

        this.dataSource.sortingDataAccessor = (data, property) => {
          switch (property) {
            case 'status': return data.status.naziv.toLocaleLowerCase();
            default: return data[property];
          }
        };

        this.dataSource.sort = this.sort;
        this.dataSource.paginator = this.paginator;

      }
    ),
      (error: Error) => {
        console.log(error.name + ' ' + error.message);
      }
  }

  openDialog(flag: number, id?: number, ime?: string, prezime?: string, brojIndeksa?: string, status?: Status,
    departman?: Departman) {
      const dialogRef = this.dialog.open(StudentDialogComponent, 
        { data: {id, ime, prezime, brojIndeksa, status, departman}
      });
      dialogRef.componentInstance.flag = flag;
      if(flag === 1) {
        dialogRef.componentInstance.data.departman = this.selektovanDepartman;
      }

      dialogRef.afterClosed().subscribe( res => {
        if(res === 1) {
          this.loadData();
        }
      }
      )
  }

  applyFilter(filterValue: string) {
    filterValue = filterValue.trim();
    filterValue = filterValue.toLowerCase();
    this.dataSource.filter = filterValue;
  }

}