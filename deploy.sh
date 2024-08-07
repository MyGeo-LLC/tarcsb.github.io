name: Deploy to GitHub Pages

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository
      uses: actions/checkout@v2

    - name: Set up Node.js
      uses: actions/setup-node@v2
      with:
        node-version: '14'

    - name: Install dependencies
      run: npm install

    - name: Build the project
      run: npm run build

    - name: Deploy to GitHub Pages
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      run: |
        git config --global user.name 'tarcsb'
        git config --global user.email 'tarcsb@users.noreply.github.com'
        git add -A
        git commit -m "Deploy to GitHub Pages"
        git push -f origin HEAD:gh-pages

