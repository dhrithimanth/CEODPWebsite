import { Routes } from '@angular/router';
import { HomeComponent } from './features/home/home.component';
import { AboutComponent } from './features/about/about';
import { ModulesComponent } from './features/modules/modules';
import { ArchitectureComponent } from './features/architecture/architecture';
import { WhyCeodpComponent } from './features/why-ceodp/why-ceodp';
import { TestimonialsComponent } from './features/testimonials/testimonials';
import { NewsComponent } from './features/news/news';
import { ContactComponent } from './features/contact/contact';

export const routes: Routes = [
    { path: '', component: HomeComponent },
    { path: 'about', component: AboutComponent },
    { path: 'product-suite', component: ModulesComponent },
    { path: 'architecture', component: ArchitectureComponent },
    { path: 'why-ceodp', component: WhyCeodpComponent },
    { path: 'testimonials', component: TestimonialsComponent },
    { path: 'news', component: NewsComponent },
    { path: 'contact', component: ContactComponent },
    { path: '**', redirectTo: '' }
];
