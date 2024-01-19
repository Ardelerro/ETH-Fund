// mockData.js

const mockFundraisers = [
    {
      id: 1,
      name: 'Fundraiser One',
      slug: 'fundraiser-one',
      description: 'Description for Fundraiser One',
      imageUrl: 'https://example.com/fundraiser-one.jpg',
    },
    {
      id: 2,
      name: 'Fundraiser Two',
      slug: 'fundraiser-two',
      description: 'Description for Fundraiser Two',
      imageUrl: 'https://example.com/fundraiser-two.jpg',
    },
    {
      id: 3,
      name: 'Fundraiser Three',
      slug: 'fundraiser-three',
      description: 'Description for Fundraiser Three',
      imageUrl: 'https://example.com/fundraiser-three.jpg',
    },
    {
        id: 4,
        name: 'Fundraiser One',
        slug: 'fundraiser-one',
        description: 'Description for Fundraiser One',
        imageUrl: 'https://example.com/fundraiser-one.jpg',
      },
      {
        id: 5,
        name: 'Fundraiser Two',
        slug: 'fundraiser-two',
        description: 'Description for Fundraiser Two',
        imageUrl: 'https://example.com/fundraiser-two.jpg',
      },
      {
        id: 6,
        name: 'Fundraiser Three',
        slug: 'fundraiser-three',
        description: 'Description for Fundraiser Three',
        imageUrl: 'https://example.com/fundraiser-three.jpg',
      },
      {
        id: 7,
        name: 'Fundraiser One',
        slug: 'fundraiser-one',
        description: 'Description for Fundraiser One',
        imageUrl: 'https://example.com/fundraiser-one.jpg',
      },
      {
        id: 8,
        name: 'Fundraiser Two',
        slug: 'fundraiser-two',
        description: 'Description for Fundraiser Two',
        imageUrl: 'https://example.com/fundraiser-two.jpg',
      },
      {
        id: 9,
        name: 'Fundraiser Three',
        slug: 'fundraiser-three',
        description: 'Description for Fundraiser Three',
        imageUrl: 'https://example.com/fundraiser-three.jpg',
      },
      {
          id: 10,
          name: 'Fundraiser One',
          slug: 'fundraiser-one',
          description: 'Description for Fundraiser One',
          imageUrl: 'https://example.com/fundraiser-one.jpg',
        },
        {
          id: 11,
          name: 'Fundraiser Two',
          slug: 'fundraiser-two',
          description: 'Description for Fundraiser Two',
          imageUrl: 'https://example.com/fundraiser-two.jpg',
        },
        {
          id: 12,
          name: 'Fundraiser Three',
          slug: 'fundraiser-three',
          description: 'Description for Fundraiser Three',
          imageUrl: 'https://example.com/fundraiser-three.jpg',
        },
  ];
  
  const getMockFundraisers = () => {
    return mockFundraisers;
  };
  
  const getMockFundraiserDetails = (slug) => {
    return mockFundraisers.find((fundraiser) => fundraiser.slug === slug);
  };
  
  export { getMockFundraisers, getMockFundraiserDetails };
  