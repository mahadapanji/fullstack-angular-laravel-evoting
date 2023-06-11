import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit  {

  constructor(private router: Router) { }
  isLogin = false;


  ngOnInit() {
    const value = localStorage.getItem('user');
    if (value !== null) {
      this.isLogin = true;
        console.log("ada");
    } else {
      
      this.isLogin = false;
      console.log("tidak ada");
    }
    const sessionUser = localStorage.getItem("user");
    console.log(sessionUser);
  }

  logout(){
    localStorage.removeItem('user');
    localStorage.setItem("pageRefreshed", 'true');
    this.router.navigate(['/']);
    
  }
  title = 'ui-angular';
}
