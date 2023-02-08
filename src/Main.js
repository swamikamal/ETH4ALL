import React from 'react'
import web3 from './infura';

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
  return (
    <div>Main</div>
  )
}
