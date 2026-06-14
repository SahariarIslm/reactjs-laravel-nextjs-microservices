import React from 'react';
import Main from './pages/Main';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import Login from './public/Login';
import Register from './public/Register';
import Rankings from './pages/Rankings';
import Stats from './pages/Stats';
import './App.css'

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Routes>
          <Route path='/' Component={Main} />
          <Route path='/login' Component={Login} />
          <Route path='/register' Component={Register} />
          <Route path='/rankings' Component={Rankings} />
          <Route path='/stats' Component={Stats} />
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
