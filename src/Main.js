import React, { useState } from 'react'
import Web3 from 'web3';


async function checkMetaMask() {
  if (window.ethereum) {
    window.web3 = new Web3(window.ethereum);
    try {
      await window.ethereum.enable();
      return true;
    } catch (error) {
      console.error(error);
    }
  } else if (window.web3) {
    window.web3 = new Web3(window.web3.currentProvider);
    return true;
  } else {
    console.error(
      'Non-Ethereum browser detected. You should consider trying MetaMask!'
    );
  }
}

export default function Main() {
  const [isConnected, setIsConnected] = useState(false);

  async function handleConnectWalletClick() {
    const isMetaMaskEnabled = await checkMetaMask();
    setIsConnected(isMetaMaskEnabled);
  }

  return (
    <div>
      {isConnected ? (
        <p>Wallet Connected</p>
      ) : (
        <button onClick={handleConnectWalletClick}>Connect Wallet</button>
      )}
    </div>
  );
}

