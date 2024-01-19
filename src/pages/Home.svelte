<script>
    import { onMount } from 'svelte';
    import FundraiserTile from '../components/FundraiserTile.svelte';
    import { getFundraisers } from '../services/api';
  
    // State to store fundraisers data
    let fundraisers = [];
  
    // Fetch fundraisers data on component mount
    onMount(async () => {
      try {
        fundraisers = await getFundraisers(); 
      } catch (error) {
        console.error('Error fetching fundraisers:', error);
      }
    });
  </script>
  

  <style>
    .home {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
      gap: 1rem;
      width: 100%;
      height: 100%;
      padding-top: 20px;
    }
  </style>
  
  <div class="home">
    {#if fundraisers.length > 0}
      {#each fundraisers as fundraiser (fundraiser.id)}
        <FundraiserTile {fundraiser} />
      {/each}
    {:else}
      <p>No fundraisers available.</p>
    {/if}
  </div>
  