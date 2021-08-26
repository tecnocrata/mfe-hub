import { Component, OnInit } from '@angular/core';
// import mountAbout from 'body/mountAbout';

@Component({
  selector: 'app-welcome',
  templateUrl: './welcome.component.html',
  // template: '<VueComp/>',
  styleUrls: ['./welcome.component.css'],
})
export class WelcomeComponent implements OnInit {
  constructor() {}

  ngOnInit(): void {
    // mountAbout('#about');
    import('body/mountAbout').then((mountHeader) => {
      console.log('Mounting!!!! ', mountHeader);
      mountHeader.default('#about');
    });
  }
}
