import "./App.css";
import Articles from "./components/Articles";
import Navbar from "./components/Navbar";
import LoadingSpinner from "./components/LoadingSpinner";
import { useState, useEffect } from 'react';

function App() {
  const [headlines, setHeadlines] = useState([]);
  const [isMount, setIsMount] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const [errorMessage, setErrorMessage] = useState("");

  const url = "http://localhost:3000/api/v1/articles.json"
  const base_url = "https://www.smashingmagazine.com/";

  function getArticles() {
    const response = fetch(url)
        .then(response => response.json())
    return response;
  }

  useEffect(() => {
    setIsMount(true)
    getArticles().then(data => {
      if (isMount) {
        setHeadlines(data);
      }
    });

    return () => {
      setIsMount(false);
    };

  }, [isMount]);

  function handleClick() {
    setIsLoading(true);
    const url = 'http://localhost:3000/api/v1/articles/scrape';
    fetch(url, {
      method: "POST",
      headers: { 'Content-Type': 'application/json' }
    }).then(() => {
      setIsLoading(false)
    })
      .catch(() => {
        setErrorMessage("Unable to scrape");
        setIsLoading(false);
      })
  }
   
  return (
    <div className="App">
      { errorMessage ?? errorMessage }
      <Navbar handleClick={handleClick} />
      {isLoading ? <LoadingSpinner /> : <Articles headlines={headlines} isMount={isMount} base_url={base_url} /> }
      { console.log(headlines, "Helloooooo")}
    </div>
  );
}

export default App;
