import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRemoteRoutingModule } from './app-remote-routing.module';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { WelcomeComponent } from './welcome/welcome.component';

@NgModule({
  declarations: [AppComponent, WelcomeComponent],
  imports: [BrowserModule, AppRemoteRoutingModule], //AppRoutingModule
  providers: [],
})
export class AppRemoteModule {}
