import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EditorsRoutingModule } from './editors-routing.module';
import { EditorsComponent } from './editors.component';


@NgModule({
  declarations: [
    EditorsComponent
  ],
  imports: [
    CommonModule,
    EditorsRoutingModule
  ]
})
export class EditorsModule { }
