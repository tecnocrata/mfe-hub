import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EditorsRoutingModule } from './editors-routing.module';
import { EditorsComponent } from './editors.component';
import { PlayEditorComponent } from './play-editor/play-editor.component';


@NgModule({
  declarations: [
    EditorsComponent,
    PlayEditorComponent
  ],
  imports: [
    CommonModule,
    EditorsRoutingModule
  ]
})
export class EditorsModule { }
