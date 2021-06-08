import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Departman } from 'src/app/models/departman';
import { Fakultet } from 'src/app/models/fakultet';
import { DepartmanService } from 'src/app/services/departman.service';
import { FakultetService } from 'src/app/services/fakultet.service';

@Component({
  selector: 'app-departman-dialog',
  templateUrl: './departman-dialog.component.html',
  styleUrls: ['./departman-dialog.component.css']
})
export class DepartmanDialogComponent implements OnInit {

  flag: number;
  fakulteti: Fakultet[];

  constructor(public fakultetService: FakultetService, 
              public departmanService: DepartmanService,
              public snackBar: MatSnackBar,
              public dialogRef: MatDialogRef<DepartmanDialogComponent>,
              @Inject (MAT_DIALOG_DATA) public data: Departman) { }

  ngOnInit(): void {
    this.fakultetService.getAllFakultets().subscribe(
      data => {
        this.fakulteti = data;
      }
    )
  }

  compareTo(a, b) {
    return a.id == b.id;
  }

  public add(): void {
    this.departmanService.addDepartman(this.data).subscribe(() => {
      this.snackBar.open('Departman uspešno dodat: ' + this.data.id, 'OK', {
        duration: 2500
      });
    }),
    (error: Error) => {
      console.log(error);
      this.snackBar.open('Došlo je do greške prilikom dodavanja departmana.', 'Zatvori', {
        duration: 2500
      });
    }
  }

  public update(): void {
    this.departmanService.updateDepartman(this.data).subscribe(() => {
      this.snackBar.open('Departman uspešno izmenjen: ' + this.data.id, 'OK', {
        duration: 2500
      });
    }),
    (error: Error) => {
      console.log(error);
      this.snackBar.open('Došlo je do greške prilikom izmene departmana.', 'Zatvori', {
        duration: 2500
      });
    }
  }

  public delete(): void {
    this.departmanService.deleteDepartman(this.data.id).subscribe(() => {
      this.snackBar.open('Departman uspešno obrisan: ' + this.data.id, 'OK', {
        duration: 2500
      });
    }),
    (error: Error) => {
      console.log(error);
      this.snackBar.open('Došlo je do greške prilikom brisanja departmana.', 'Zatvori', {
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
