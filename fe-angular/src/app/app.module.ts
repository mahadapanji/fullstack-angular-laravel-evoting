import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { RouterModule } from '@angular/router';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { HomeComponent } from './home/home.component';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { RegisterComponent } from './register/register.component';
import { VoteComponent } from './vote/vote.component';
import { ModalComponent } from './modal/modal.component';
import { VoteResultComponent } from './vote-result/vote-result.component';
import { AnnouncementComponent } from './announcement/announcement.component';


@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    HomeComponent,
    RegisterComponent,
    VoteComponent,
    ModalComponent,
    VoteResultComponent,
    AnnouncementComponent
  ],
  imports: [
    BrowserModule,
    RouterModule.forRoot([
      {path: 'login', component: LoginComponent},
      {path: 'register', component: RegisterComponent},
      {path: 'vote', component: VoteComponent},
      {path: 'result', component: VoteResultComponent},
      {path: 'announcement', component: AnnouncementComponent},
       {path: '', component: HomeComponent},
    ]),
    NgbModule,
    FormsModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
