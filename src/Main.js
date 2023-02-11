import { useState, useEffect } from 'react';
import Web3 from 'web3';
import InfuraIPFSUpload from './infura';
export default function Main() {
  
  const [walletAddress, setWalletAddress] = useState('');
  async function handleConnectWalletClick() {
    const address = await getWalletAddress();
    setWalletAddress(address);
  }
  async function getWalletAddress() {
    if (window.ethereum) {
      // Modern dapp browsers
      try {
        await window.ethereum.request({ method: 'eth_requestAccounts' });
        const accounts = await window.ethereum.request({ method: 'eth_accounts' });
        return accounts[0];
      } catch (error) {
        console.error(error);
      }
    } else if (window.web3) {
      // Legacy dapp browsers
      const web3 = new Web3(window.web3.currentProvider);
      const accounts = await web3.eth.getAccounts();
      return accounts[0];
    } else {
      <p>'Non-Ethereum browser detected. You should consider trying MetaMask!'</p>
    }
  }

  return (
    <div>
     
      
      {walletAddress ? (
        <InfuraIPFSUpload walletAddress={walletAddress} />
      ) : (
        <button onClick={handleConnectWalletClick}>Connect Wallet</button>
      )}
    </div>
    
  );
}

