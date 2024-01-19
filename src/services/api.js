import { getMockFundraiserDetails, getMockFundraisers } from "./mockdata";

const API_BASE_URL = 'https://feb0dae7-c9cf-4899-9c44-94664f7fd8d3.mock.pstmn.io';

// Function to fetch the list of fundraisers
/*
export const getFundraisers = async () => {
  try {
    const response = await fetch(`${API_BASE_URL}/fundraisers`);
    if (!response.ok) {
      throw new Error('Failed to fetch fundraisers');
    }

    const data = await response.json();
    return data;
  } catch (error) {
    console.error('Error in getFundraisers:', error);
    throw error;
  }
};

// Function to fetch details of a specific fundraiser
export const getFundraiserDetails = async (slug) => {
  try {
    const response = await fetch(`${API_BASE_URL}/fundraisers/${slug}`);
    if (!response.ok) {
      throw new Error('Failed to fetch fundraiser details');
    }

    const data = await response.json();
    return data;
  } catch (error) {
    console.error('Error in getFundraiserDetails:', error);
    throw error;
  }
};
*/
//mock
export const getFundraisers = async () => {
    return getMockFundraisers()
  };
  
  // Function to fetch details of a specific fundraiser
  export const getFundraiserDetails = async (slug) => {
    return getMockFundraiserDetails(slug)
  };
