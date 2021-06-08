import { Component, Inject, OnDestroy, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Subscription } from 'rxjs';
import { Status } from 'src/app/models/status';
import { Student } from 'src/app/models/student';
import { StatusService } from 'src/app/services/status.service';
import { StudentService } from 'src/app/services/student.service';

@Component({
  selector: 'app-student-dialog',
  templateUrl: './student-dialog.component.html',
  styleUrls: ['./student-dialog.component.css']
})
export class StudentDialogComponent implements OnInit, OnDestroy {

  public flag: number;
  statusi: Status[];
  statusSubscritption: Subscription;

  constructor(@Inject(MAT_DIALOG_DATA) public data: Student,
              public statusService: StatusService,
              public studentService: StudentService,
              public snackBar: MatSnackBar,
              public dialogRef: MatDialogRef<StudentDialogComponent>) { }

  ngOnDestroy(): void {
    this.statusSubscritption.unsubscribe();
  }

  ngOnInit(): void {
    this.statusSubscritption = this.statusService.getAllStatuses().subscribe(
      data => {
        this.statusi = data;
      }
    ),
    (error: Error) => {
      console.log(error.name + ' ' + error.message);
    }
  }

  compareTo(a, b) {
    return a.id == b.id;
  }

  public add(): void {
    this.studentService.addStudent(this.data).subscribe(() => {
      this.snackBar.open('Student uspešno dodat.', 'OK', {
        duration: 2500
      });
    }),
    (error: Error) => {
      console.log(error);
      this.snackBar.open('Došlo je do greške prilikom dodavanja studenta.', 'Zatvori', {
        duration: 2500
      });
    }
  }

  public update(): void {
    this.studentService.updateStudent(this.data).subscribe(() => {
      this.snackBar.open('Student uspešno izmenjen: ' + this.data.id, 'OK', {
        duration: 2500
      });
    }),
    (error: Error) => {
      console.log(error);
      this.snackBar.open('Došlo je do greške prilikom izmene studenta.', 'Zatvori', {
        duration: 2500
      });
    }
  }

  public delete(): void {
    this.studentService.deleteStudent(this.data.id).subscribe(() => {
      this.snackBar.open('Student uspešno obrisan: ' + this.data.id, 'OK', {
        duration: 2500
      });
    }),
    (error: Error) => {
      console.log(error);
      this.snackBar.open('Došlo je do greške prilikom brisanja studenta.', 'Zatvori', {
        duration: 2500
      });
    }
  }

  public cancel(): void {
    this.dialogRef.close();
    this.snackBar.open('Odustali ste.', 'Zatvori', {
      duration: 1000
    });
  }

}
