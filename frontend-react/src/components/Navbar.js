import React from 'react'

function Navbar(props) {
  return (
    <div>
      <nav className="navbar navbar-expand-lg bg-light">
        <div className="container-fluid d-flex justify-content-between">
          <a className="navbar-brand" href="/">Web Scraper</a>
          <div className="collapse navbar-collapse" id="navbarScroll">
            <button className="btn btn-outline-success" onClick={props.handleClick}>Scrape</button>
          </div>
        </div>
      </nav>
    </div>
  )
}

export default Navbar
