package my.scope;

public class Counter {
	private int num;
	public Counter() {
		System.out.println("Counter 객체가 만들어 졌습니다");
	}
	
	public void setCount(int i) {
		num +=i;
	}
	
	public int getCount() {
		return num;
	}
}
