void main() {
  List<int> nums = [2, 2, 1, 1, 1, 2, 2];

  int candidate = nums[0];
  int count = 0;

  for (int num in nums) {
    if (count == 0) {
      candidate = num;
    }
    count += (num == candidate) ? 1 : -1;
  }

  print("The majority element is: $candidate");
}
