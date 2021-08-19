import { NgModule } from '@angular/core';
import { APP_BASE_HREF, CommonModule } from '@angular/common';

import { RobotRoutingModule } from './robot-routing.module';
import { RobotComponent } from './robot.component';
import { BrowserModule } from '@angular/platform-browser';

// @NgModule({
//   declarations: [RobotComponent],
//   providers: [{ provide: APP_BASE_HREF, useValue: '/' }],
//   imports: [CommonModule, BrowserModule, RobotRoutingModule],
//   bootstrap: [RobotComponent],
// })
@NgModule({
  declarations: [RobotComponent],
  imports: [CommonModule, RobotRoutingModule],
})
export class RobotModule {}
