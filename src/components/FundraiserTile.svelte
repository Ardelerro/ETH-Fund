<script>
    import { Link } from 'svelte-routing';
  
    export let fundraiser;
  
    const handleClick = () => {

    };
  </script>
  
  <style>
    .fundraiser-tile {
      display: flex;
      flex-direction: column;
      border: 1px solid #ddd;
      border-radius: 8px;
      overflow: hidden;
      cursor: pointer;
      transition: transform 0.2s ease-in-out;
      height: fit-content;
    }
  
    .fundraiser-tile:hover {
      transform: scale(1.02);
    }
  
    .image-container {
      width: 100%;
      height: 200px;
      overflow: hidden;
    }
  
    img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
  
    .content {
      padding: 1rem;
    }
  
    h2 {
      font-size: 1.5rem;
      margin-bottom: 0.5rem;
    }
  
    p {
      font-size: 1rem;
      color: #555;
    }
  </style>
  
  <div class="fundraiser-tile" on:click={handleClick}>
    <Link to={`/fundraisers/${fundraiser.slug}`}>
      <div class="image-container">
        <img src={fundraiser.imageUrl || 'path-to-default-image.jpg'} alt="Fundraiser Image" />
      </div>
      <div class="content">
        <h2>{fundraiser.name}</h2>
        <p>{fundraiser.description}</p>
      </div>
    </Link>
  </div>
  