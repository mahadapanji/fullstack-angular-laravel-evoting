import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent {
  // selectedOption = new FormControl();
  constructor(private router: Router,
    private http: HttpClient) { }
    
  model = {
    nim:"",
    nama:"",
    password:"",
    birth_date:"",
    prodi:"Teknik Informatika"
  }

prodis = [
  {
    prodi:"Teknik Informatika"
  },
  {
    prodi:"Sistem Informasi"
  }
]

changeCity(e: any) {
  this.model.prodi = e.target.value;
}

onSubmit() {
  console.log(this.model);
  this.postData();
}

postData() {
  // Request body data
  const body = {
    name: this.model.nama,
    username: this.model.nama,
    password: this.model.password,
    birth_date: this.model.birth_date,
    prodi: this.model.prodi
  };

  // POST request
  this.http.post('http://127.0.0.1:8000/api/register', body)
    .subscribe((response) => {
      // Handle the API response
      console.log(response);
      alert("Success Register !");
      this.router.navigate(['/login']);
    }, (error) => {
      // Handle errors
      alert(error.error.message);
      // console.error(error);
    });
}


}
