import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  ngOnInit(){
    if (localStorage.getItem('pageRefreshed') === 'true') {
      localStorage.setItem('pageRefreshed', 'false');
      window.location.reload();
    }
  }


  // logout(){
  //   localStorage.removeItem('user');
    
  // }

  itemImageUrl = 'assets/images/logo.png';
}
