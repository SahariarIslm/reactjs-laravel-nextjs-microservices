import React from 'react'

const Menu = () => {
  return (
    <div className="sidebar border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary" style={{ height: '100vh' }}> 
        <svg xmlns="http://www.w3.org/2000/svg" className="d-none"> 
            <symbol id="house-fill" viewBox="0 0 16 16"> 
                <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"></path> 
                <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z"></path> 
            </symbol> 
        </svg> 
        <div className="offcanvas-md offcanvas-end bg-body-tertiary" tabIndex={-1} id="sidebarMenu" aria-labelledby="sidebarMenuLabel"> 
            <div className="offcanvas-header"> 
                <h5 className="offcanvas-title" id="sidebarMenuLabel">Company name</h5> 
                <button type="button" className="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#sidebarMenu" aria-label="Close"></button> 
            </div> 
            <div className="offcanvas-body d-md-flex flex-column p-0 pt-lg-3 overflow-y-auto"> 
            <ul className="nav flex-column"> 
                <li className="nav-item"> 
                    <a className="nav-link d-flex align-items-center gap-2 active" aria-current="page" href="#"> 
                        <svg className="bi" aria-hidden="true"><use xlinkHref="#house-fill"></use></svg>
                        Dashboard
                    </a> 
                </li> 
            </ul> 
            </div>
        </div>
    </div> 
  )
}

export default Menu