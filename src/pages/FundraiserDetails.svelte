
  <script>

    import { onMount } from 'svelte';
    import { getFundraiserDetails } from '../services/api';
    import { Link } from 'svelte-routing';
    import { ethers } from 'ethers'; // Ethereum library, you may need to install this package
    import Crowdfunding from '../../build/contracts/Crowdfunding.json'

    let fundraiserDetails;
    let slug;

    let donationAmount = 0;
    let isWalletConnected = false;

    const connectWallet = async () => {

      try {
        // Requesting access to MetaMask's Ethereum provider
        await window.ethereum.request({ method: 'eth_requestAccounts' });
        
        // Set isWalletConnected to true upon successful connection
        isWalletConnected = true;
      } catch (error) {
        console.error('Error connecting to MetaMask:', error);
        // Handle connection error
      }
    };
    const donate = async () => {
      if (!isWalletConnected) {
        return;
      }

      try {
        // @ts-ignore
        const provider = new ethers.providers.Web3Provider(window.ethereum);
        const signer = provider.getSigner();

        const contract = new ethers.Contract(Crowdfunding.address, Crowdfunding.abi, signer);

        // Donate to the fundraiser using the contract
        const transaction = await contract.donate(fundraiserDetails.id, { value: donationAmount });

        // Wait for the transaction
        await transaction.wait();

        // Handle successful donation
      } catch (error) {
        console.error('Error donating to Aave:', error);
        // Handle donation error
      }
    };
  
    onMount(async () => {
      slug = window.location.pathname.split('/').pop();
  
      try {
        fundraiserDetails = await getFundraiserDetails(slug);
      } catch (error) {
        console.error('Error fetching fundraiser details:', error);
      }
    });
  </script>
  
  <style>
    .fundraiser-details {
      max-width: 800px;
      margin: 0 auto;
      padding: 1rem;
    }
  
    .image-container {
      width: 100%;
      max-height: 400px;
      overflow: hidden;
      margin-bottom: 1rem;
    }
  
    img {
      width: 100%;
      height: auto;
      object-fit: cover;
    }
  
    h1 {
      font-size: 2rem;
      margin-bottom: 0.5rem;
    }
  
    p {
      font-size: 1rem;
      color: #555;
    }
  </style>
  
  <div class="fundraiser-details">
    {#if fundraiserDetails}
      <div class="image-container">
        <img src={fundraiserDetails.imageUrl || 'path-to-default-image.jpg'} alt="Fundraiser Image" />
      </div>
      <h1>{fundraiserDetails.name}</h1>
      <p>{fundraiserDetails.description}</p>
      <!-- Add more details as needed -->
      {#if isWalletConnected}
        <label for="donationAmount">Donation Amount (ETH):</label>
        <input type="number" id="donationAmount" bind:value={donationAmount} />
        <button on:click={donate}>Donate</button>
      {:else}
        <button on:click={connectWallet}>Connect Wallet</button>
      {/if}
      
    {:else}
      <p>Loading...</p>
    {/if}
  
    <Link to="/">Back to Home</Link>
  </div>
  