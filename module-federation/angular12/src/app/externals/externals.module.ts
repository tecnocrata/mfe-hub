import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ExternalsRoutingModule } from './externals-routing.module';
import { ExternalsComponent } from './externals.component';


@NgModule({
  declarations: [
    ExternalsComponent
  ],
  imports: [
    CommonModule,
    ExternalsRoutingModule
  ]
})
export class ExternalsModule { }
