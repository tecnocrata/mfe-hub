import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRemoteModule } from './app-remote.module';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { WelcomeComponent } from './welcome/welcome.component';

/*
@NgModule({
  declarations: [
    AppComponent,
    WelcomeComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
*/

@NgModule({
  declarations: [
    // AppComponent,
    // WelcomeComponent
  ],
  imports: [BrowserModule, AppRemoteModule, AppRoutingModule],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
