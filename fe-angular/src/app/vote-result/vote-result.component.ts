import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';

@Component({
  selector: 'app-vote-result',
  templateUrl: './vote-result.component.html',
  styleUrls: ['./vote-result.component.css']
})
export class VoteResultComponent {

  constructor(private http: HttpClient) {}


  candidates: any[] = []; // Replace any[] with the appropriate type for your candidates data

  data: any = {};


  ngOnInit(): void {
    // Fetch candidates data from an API or assign it directly here
   
    this.getData();
  }

  getData(){
    this.http.get('http://127.0.0.1:8000/api/candidat/result')
  .subscribe((response: any) => {
    // Handle the API response
    console.log(response);
    this.data = response.data;
  }, (error) => {
    // Handle errors
    console.log(error.error.message);
  });
  }

  refresh_page(){
    window.location.reload();
  }

}
