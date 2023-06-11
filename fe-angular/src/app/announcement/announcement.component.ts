import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-announcement',
  templateUrl: './announcement.component.html',
  styleUrls: ['./announcement.component.css']
})
export class AnnouncementComponent implements OnInit {
  constructor(private http: HttpClient) { }

  data: any = {};

  ngOnInit(): void {
    this.getData();
  }

  getData(){
    this.http.get('http://127.0.0.1:8000/api/config')
  .subscribe((response: any) => {
    // Handle the API response
    console.log(response);
    this.data = response.data;
  }, (error) => {
    // Handle errors
    console.log(error.error.message);
  });
  }

}
