import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
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
    ],
  },
  {
    path: 'playeditor',
    component: EditorsComponent,
    children: [
      {
        path: 'playeditor',
        component: PlayEditorComponent,
      },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class EditorsRoutingModule {}
