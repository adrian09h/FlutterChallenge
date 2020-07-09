# Flutter_Album

Album

## Getting Started

This project is a Flutter application to show photos fetched from a [Public API](https://jsonplaceholder.typicode.com)

## Notes
- Pagination

No pagination API for photos from the https://jsonplaceholder.typicode.com
That's why the app manipulate '/photos' API response to return the correct page data.
For example, for the page 2, it will request as below.
https://jsonplaceholder.typicode.com/photos?albumId=1&page=2&per_page=10
It still returns all of photos of the album.(50 photos).
The the app will manipulate the API response to return a corresponding page data. In this case, it will manipulate to return photos of that ID is in range of 11 ~ 20. 

- Photo details screen

The app shows the thumbnial image as a placeholder image and then loads image from the photo URL.
