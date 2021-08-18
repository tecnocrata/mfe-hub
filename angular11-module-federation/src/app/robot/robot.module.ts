import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { RobotRoutingModule } from './robot-routing.module';
import { RobotComponent } from './robot.component';

@NgModule({
  declarations: [RobotComponent],
  imports: [CommonModule, RobotRoutingModule],
})
export class RobotModule {}
