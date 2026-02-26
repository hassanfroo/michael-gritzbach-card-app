import React from 'react';
import { QRCodeSVG } from 'qrcode.react';
import './index.css';

function App() {
  const linkedinUrl = "https://www.linkedin.com/in/michael-gritzbach/";
  const websiteUrl = "https://michael-gritzbach.eu";
  const name = "Michael Gritzbach";

  return (
    <div className="container">
      <div className="card">
        <div className="qr-container">
          <QRCodeSVG
            value={linkedinUrl}
            size={200}
            level={"H"}
            includeMargin={false}
          />
        </div>
        <h1 className="name">{name}</h1>
        <a
          href={websiteUrl}
          className="website"
          target="_blank"
          rel="noopener noreferrer"
        >
          {websiteUrl.replace('https://', '')}
        </a>
      </div>
    </div>
  );
}

export default App;
