import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Status } from 'src/app/models/status';
import { StatusService } from 'src/app/services/status.service';

@Component({
  selector: 'app-status-dialog',
  templateUrl: './status-dialog.component.html',
  styleUrls: ['./status-dialog.component.css']
})
export class StatusDialogComponent implements OnInit {

  public flag: number;

  constructor(public snackBar: MatSnackBar, public dialogRef: MatDialogRef<StatusDialogComponent>, @Inject (MAT_DIALOG_DATA) public data: Status, public statusService: StatusService) { }

  ngOnInit(): void {
  }

  public add(): void {
    this.statusService.addStatus(this.data).subscribe(() => {
      this.snackBar.open('Uspešno dodat status: ' + this.data.naziv, 'Ok', {
        duration: 2500
      })
    }),
    (error: Error) => {
      console.log(error.name + ' ' + error.message);
      this.snackBar.open('Došlo je do greške prilikom dodavanja novog statusa!', 'Zatvori', {
        duration: 2500
      })
    }
  }

  public update(): void {
    this.statusService.updateStatus(this.data).subscribe(() => {
      this.snackBar.open('Uspešno modifikovan status: ' + this.data.naziv, 'Ok', {
        duration: 2500
      })
    }),
    (error: Error) => {
      console.log(error.name + ' ' + error.message);
      this.snackBar.open('Došlo je do greške prilikom izmene statusa!', 'Zatvori', {
        duration: 2500
      })
    }
  }

  public delete(): void {
    this.statusService.deleteStatus(this.data.id).subscribe(() => {
      this.snackBar.open('Uspešno obrisan status: ' + this.data.naziv, 'Ok', {
        duration: 2500
      })
    }),
    (error: Error) => {
      console.log(error.name + ' ' + error.message);
      this.snackBar.open('Došlo je do greške prilikom brisanja statusa!', 'Zatvori', {
        duration: 2500
      })
    }
  }

  public cancel(): void {
    this.dialogRef.close();
    this.snackBar.open('Odustali ste!', 'Zatvori', {
      duration: 2500
    })
  }

}
