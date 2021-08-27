import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-vue-component',
  templateUrl: './vue-component.component.html',
  styleUrls: ['./vue-component.component.css'],
})
export class VueComponentComponent implements OnInit {
  constructor() {}

  ngOnInit(): void {
    import('body/mountAbout').then((mountHeader) => {
      console.log('Mounting!!!! ', mountHeader);
      mountHeader.default('#about');
    });
  }
}
