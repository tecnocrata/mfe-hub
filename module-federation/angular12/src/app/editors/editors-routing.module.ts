import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AnnotationEditorComponent } from './annotation-editor/annotation-editor.component';
import { EditorsComponent } from './editors.component';
import { PlayEditorComponent } from './play-editor/play-editor.component';

const routes: Routes = [
  {
    path: '',
    component: EditorsComponent,
    children: [
      {
        path: 'playeditor',
        component: PlayEditorComponent,
      },
      {
        path: 'annotationeditor',
        component: AnnotationEditorComponent,
      },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class EditorsRoutingModule {}
