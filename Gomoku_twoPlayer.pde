int pieceNow, mX, mY;
int[][] piece = new int[16][16];
PImage blackPiece, whitePiece, blackPieceCursor, whitePieceCursor, blackWin, whiteWin;

void setup()
{
  blackPiece = loadImage("piece_black.png");
  whitePiece = loadImage("piece_white.png");
  blackPieceCursor = loadImage("cursor_black.png");
  whitePieceCursor = loadImage("cursor_white.png");
  blackWin = loadImage("blackWin.png");
  whiteWin = loadImage("whiteWin.png");
  background(255, 204, 0);
  size(800, 900);
  cursor(blackPieceCursor);
  stroke(47, 131, 4);
  
  for(int i=0; i<16; i++)
    for(int j=0; j<16; j++)
      piece[i][j] = 0;
  
  for(int i=10; i<width; i+=50)
     line(i, 0, i, height);
     
  for(int i=10; i<height; i+=50)
     line(0, i, width, i);
     
  pieceNow = 1;
  
  writeOnScreen("Welcome to Gomoku for two players.  Black first.");
}

void draw()
{
  
}

void mouseClicked()
{
  mX = mouseX;
  mY = mouseY;
  
  if((mX-10)%50 < 25)
    mX = (mX-10)/50*50+10;
  else
    mX = (mX-10)/50*50+10+50;
  
  if((mY-10)%50 < 25)
    mY = (mY-10)/50*50+10;
  else
    mY = (mY-10)/50*50+10+50;
  
  if((mX-10)/50>=16 || (mY-10)/50>=16)
  {
    writeOnScreen("Error place.  Retry!");
    println("Error place.  Retry!");
    return ;
  }
  
  if(piece[(mX-10)/50][(mY-10)/50] == 0)
    piece[(mX-10)/50][(mY-10)/50] = pieceNow;
  else
  {
    writeOnScreen("Error place.  Retry!");
    println("Error place.  Retry!");
    return ;
  }
  
  if(pieceNow == 1)
  {
    writeOnScreen("blackPiece: " + (mX-10)/50 + ", " + (mY-10)/50);
    println("blackPiece: " + (mX-10)/50 + ", " + (mY-10)/50);
    image(blackPiece, mX-20, mY-20);
    cursor(whitePieceCursor);
    pieceNow = 2;
  }
  else if(pieceNow == 2)
  {
    writeOnScreen("whitePiece: " + (mX-10)/50 + ", " + (mY-10)/50);
    println("whitePiece: " + (mX-10)/50 + ", " + (mY-10)/50);
    image(whitePiece, mX-20, mY-20);
    cursor(blackPieceCursor);
    pieceNow = 1;
  }
  else
  {
    writeOnScreen("Stop!");
    println("Stop!");
  }
  
  checkWin();
}

void checkWin()
{
  int total;
  //Check row - blackPiece
  for(int i=0; i<16; i++)
  {
    for(int j=0; j<16-5; j++)
    {
      total = 0;
      for(int k=0; k<5; k++)
      {
        if(piece[i][j+k] == 1)
          total++;
      }
      
      if(total == 5)
      {
        writeOnScreen("Black win!");
        println("Black win!");
        image(blackWin, width/2-blackWin.width/2, height/2-blackWin.height/2);
        pieceNow = 0;
      }
    }
  }
  
  //Check col - blackPiece
  for(int i=0; i<16; i++)
  {
    for(int j=0; j<16-5; j++)
    {
      total = 0;
      for(int k=0; k<5; k++)
      {
        if(piece[j+k][i] == 1)
          total++;
      }
      
      if(total == 5)
      {
        writeOnScreen("Black win!");
        println("Black win!");
        image(blackWin, width/2-blackWin.width/2, height/2-blackWin.height/2);
        pieceNow = 0;
      }
    }
  }
  
  //Check row - whitePiece
  for(int i=0; i<16; i++)
  {
    for(int j=0; j<16-5; j++)
    {
      total = 0;
      for(int k=0; k<5; k++)
      {
        if(piece[i][j+k] == 2)
          total++;
      }
      
      if(total == 5)
      {
        writeOnScreen("White win!");
        println("White win!");
        image(whiteWin, width/2-whiteWin.width/2, height/2-whiteWin.height/2);
        pieceNow = 0;
      }
    }
  }
  
  //Check col - whitePiece
  for(int i=0; i<16; i++)
  {
    for(int j=0; j<16-5; j++)
    {
      total = 0;
      for(int k=0; k<5; k++)
      {
        if(piece[j+k][i] == 2)
          total++;
      }
      
      if(total == 5)
      {
        writeOnScreen("White win!");
        println("White win!");
        image(whiteWin, width/2-whiteWin.width/2, height/2-whiteWin.height/2);
        pieceNow = 0;
      }
    }
  }
  
  //Check \ - blackPiece
  for(int i=0; i<12; i++)
  {
    for(int j=0; j<12; j++)
    {
      total = 0;
      for(int k=0; k<5; k++)
      {
        if(piece[i+k][j+k] == 1)
          total++;
      }
      
      if(total == 5)
      {
        writeOnScreen("Black win!");
        println("Black win!");
        image(blackWin, width/2-blackWin.width/2, height/2-blackWin.height/2);
        pieceNow = 0;
      }
    }
  }
  
  //Check / - blackPiece
  for(int i=0; i<16; i++)
  {
    for(int j=0; j<16; j++)
    {
      total = 0;
      for(int k=0; k<5; k++)
      {
        if((i-k)>=0 && (j+k)<16 && piece[i-k][j+k]==1)
          total++;
      }
      
      if(total == 5)
      {
        writeOnScreen("Black win!");
        println("Black win!");
        image(blackWin, width/2-blackWin.width/2, height/2-blackWin.height/2);
        pieceNow = 0;
      }
    }
  }
  
  //Check \ - whitePiece
  for(int i=0; i<12; i++)
  {
    for(int j=0; j<12; j++)
    {
      total = 0;
      for(int k=0; k<5; k++)
      {
        if(piece[i+k][j+k] == 2)
          total++;
      }
      
      if(total == 5)
      {
        writeOnScreen("White win!");
        println("White win!");
        image(whiteWin, width/2-whiteWin.width/2, height/2-whiteWin.height/2);
        pieceNow = 0;
      }
    }
  }
  
  //Check / - whitePiece
  for(int i=0; i<16; i++)
  {
    for(int j=0; j<16; j++)
    {
      total = 0;
      for(int k=0; k<5; k++)
      {
        if((i-k)>=0 && (j+k)<16 && piece[i-k][j+k]==2)
          total++;
      }
      
      if(total == 5)
      {
        writeOnScreen("White win!");
        println("White win!");
        image(whiteWin, width/2-whiteWin.width/2, height/2-whiteWin.height/2);
        pieceNow = 0;
      }
    }
  }
}

void writeOnScreen(String input)
{
  fill(0);
  rect(0, 800, width-1, 94);
  fill(47, 131, 4);
  textFont(createFont("Arial Bold", 30));
  text(input, 10, 850);
}
