import { Component, OnInit } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-vote',
  templateUrl: './vote.component.html',
  styleUrls: ['./vote.component.css']
})
export class VoteComponent implements OnInit {
  constructor(private modalService: NgbModal,
    private http: HttpClient) {}
  formModal: any;

  candidates: any[] = []; // Replace any[] with the appropriate type for your candidates data
  hasVoted: boolean = false; // Set this flag based on whether the user has already voted



  modal = {
    id: 0,
    foto: '',
    nama_calon: '',
    nama_wakil_calon: '',
    visi: '',
    misi: ''
  };
  

  ngOnInit(): void {
    // Fetch candidates data from an API or assign it directly here
    this.getData();

    // Check if the user has already voted and set the hasVoted flag accordingly
    this.checkVoteStatus();

    
  }

  getData(){
    this.http.get('http://127.0.0.1:8000/api/candidat/all')
  .subscribe((response: any) => {
    // Handle the API response
    console.log(response);
    this.candidates = response.data;
  }, (error) => {
    // Handle errors
    alert(error.error.message);
  });
  }


  vote(candidate_id: number) {
    var user_id_local = "";

    var userData = localStorage.getItem('user');
    if (userData) {
      user_id_local = JSON.parse(userData).id;
    }
    // Request body data
    const body = {
      user_id: user_id_local,
      candidate_id: candidate_id.toString(),
      ip: "",
      os: "",
      browser: ""
    };
  
    // POST request
    this.http.post('http://127.0.0.1:8000/api/vote/save', body)
      .subscribe((response) => {

        // Handle the API response
        console.log(response);
        alert("Success Memilih !");
        // this.router.navigate(['/login']);

      }, (error) => {
        // Handle errors
        
        alert("Anda Sudah Memilih !");
        console.log(error.error.message);
        // console.error(error);
      });
      
      this.closeModal('yesornomodal');
  }


  removeHTMLTags(htmlString: string): string {
    const tempElement = document.createElement('div');
    tempElement.innerHTML = htmlString;
    return tempElement.textContent || tempElement.innerText || '';
  }

  getVotingCandidateUrl(candidateId: number): string {
    // Return the voting candidate URL based on the candidateId
    return '/voting/candidate/' + candidateId;
  }

  checkVoteStatus(): void {
    // Implement your logic to check if the user has already voted
    // Set the hasVoted flag based on the result
    // Example:
    // const vote = localStorage.getItem('vote');
    // this.hasVoted = !!vote;
  }

  openModal(candidateId: number, modalName: string ){
    const modelDiv = document.getElementById(modalName);
    if(modelDiv != null){
      const candidate = this.candidates.find((candidate) => candidate.id === candidateId);
      this.modal = candidate;
      modelDiv.style.display = 'block';
    }
  }

  closeModal(modalName: string) {
    const modelDiv = document.getElementById(modalName);
    if(modelDiv != null){
      modelDiv.style.display = 'none';
    }
  }

  

}
