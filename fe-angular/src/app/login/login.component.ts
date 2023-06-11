import { Component, NgModule, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import {NgForm} from '@angular/forms';
import { Login } from './login';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})



export class LoginComponent implements OnInit {
  username: string = '';
  constructor(private router: Router,
    private http: HttpClient) { }

  powers = ['Really Smart', 'Super Flexible',
            'Super Hot', 'Weather Changer'];

  // model = new Login(1, 'Dr. IQ');
  model = {
    name:"",
    password:"",
    user_type:""
  }
  submitted = false;

  onSubmit() {
    console.log(this.model);
    this.postData();
   }

   postData() {
    const body = {
      username: this.model.name,
      password: this.model.password,
    };


    this.http.post('http://127.0.0.1:8000/api/login', body)
      .subscribe((response: any) => {
        // Handle the API response
        console.log(response);
        localStorage.setItem("user", JSON.stringify(response.data));
        localStorage.setItem("pageRefreshed", 'true');
        alert("Success Login !");
        // window.location.reload();
        this.router.navigate(['/']);
        // this.router.navigateByUrl('www.google.com');
        
        
      }, (error) => {
        // Handle errors
        alert(error.error.message);
        // console.error(error);
      });
  }


  ngOnInit() {
    
  }

  // onSubmit(f: NgForm) {
  //   console.log(f.value);  // { first: '', last: '' }
  //   console.log(f.valid);  // false
  // }

  login() {
    // Perform login logic here, check credentials, etc.

    // If login is successful, navigate to the dashboard page
    this.router.navigate(['/home']);
  }
}
