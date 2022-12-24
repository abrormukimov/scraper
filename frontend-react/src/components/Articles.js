import React from 'react'

function Articles(props) {
  return (
    <div>
      {props.headlines.length > 0 ? 
        <div className='header-row'>
          <div className='column-head-header'>Headlines</div>
          <div className='column-date-header'>When published</div>
        </div> :
        <div className='no-data-message'>
          <pre>
            No Data yet.
            Click "Scrape" on top to get data
          </pre>
        </div>
      }
      
      {props.isMount ? props.headlines.sort((a, b) => {
          return new Date(b.published_at) - new Date(a.published_at)
      }).map(headline => (
          <div className='headline-wrapper'>
            <div className="rows" key={headline.id}>
              <div className="column-head">
                <a href={props.base_url + headline.url} target="_blank" rel="noreferrer">{headline.headline}</a>
                
              </div>
              <div className="column-date">
                {headline.published_at}
              </div>
            </div>
          </div>
        )) : <div>No data</div>}
    </div>
  )
}

export default Articles;
