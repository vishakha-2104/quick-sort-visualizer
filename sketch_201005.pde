float[] values;

void setup() {
  size(600, 400);
  values = new float[width];
  for (int i = 0; i < values.length; i++) {
    values[i] = random(height);
  }
  noLoop();
}
void quicksort(float[] arr, int lo, int hi) {
  if (lo < hi) {
    int mid = partition(arr, lo, hi);
    quicksort(arr, lo, mid-1);    
    quicksort(arr, mid+1, hi);
  }
}

void mousePressed() {
  quicksort(values, 0, values.length-1);
}

void draw() {
  render();
  println("Help");
}

// Broken partition code that I tried to write
// TODO: Help!
int partition(float[] arr, int lo, int hi) {
  //println("Partition " + lo + " to " + hi);
  float pivot = arr[hi];
  int left = lo-1;
  int right = hi-1;

  while (left <= right) {
    left++;
    println(left, right);
    if (arr[left] >= pivot) {
      while (right > left) {
        if (arr[right] < pivot) {
          swap(arr, left, right);
          break;
        }
        right--;
      }
    }
  }

  if (left < hi-1) {
    swap(arr, left, hi);
  }
  println("Mid: "+ left);
  return left;
}


void render() {
  background(0);
  for (int i = 0; i < values.length; i++) {
    stroke(255);
    line(i, height, i, height - values[i]);
  }
}

void swap(float[] arr, int a, int b) {
  float temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;


  redraw();
}
