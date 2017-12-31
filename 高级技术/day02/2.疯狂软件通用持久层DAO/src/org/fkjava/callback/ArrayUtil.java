package org.fkjava.callback;

/**
 * 接口
 * */
interface callback{
	// 处理数组
	void doInCallback(int[] array);
}

/**
 * 处理数组的类
 * */
public class ArrayUtil {
	
	/**
	 * 处理数组的方法
	 * @param int[] array 要处理的数组
	 * @param 回调接口，该接口处理数组
	 * */
	public void process(int[] array,callback callback){
		// 调用接口的方法处理数组
		callback.doInCallback(array);
	}
	
	public static void main(String[] args) {
		ArrayUtil t = new ArrayUtil();
		// 准备数组
		int[] array = new int[]{1,2,3,4,5};
		// A 遍历
		t.process(array, new callback() {
			
			@Override
			public void doInCallback(int[] array) {
				for(int i : array){
					System.out.print(i + "\t");
				}
				System.out.println();
			}
		});
		// B 计算总和
		t.process(array, new callback() {
			
			@Override
			public void doInCallback(int[] array) {
				int sum = 0;
				for(int i : array){
					sum += i;
				}
				System.out.println("总和：" + sum);
			}
		});
	}

}
