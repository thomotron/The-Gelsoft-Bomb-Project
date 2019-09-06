int counter = 10;
bool running = true;

void setup() {
  pinMode(7, OUTPUT);
  digitalWrite(7, LOW);
  Serial.begin(9600);
}

void loop() {
  // Don't do anything if we've already detonated
  if (!running) return;
  
  if (counter == 0)
  {
    // Just make a loud noise forever
    digitalWrite(7, HIGH);

    // Print our last message
    Serial.println("You're dead lmao");

    // Flip the running switch off
    running = false;
  }
  else
  {
    // Print the counter to serial
    Serial.println(counter);

    // Beep for 100ms
    digitalWrite(7, HIGH);
    delay(100);
    digitalWrite(7, LOW);

    // Wait the remaining 900ms
    delay(900);

    // Decrement the counter
    counter--;
  }
}
