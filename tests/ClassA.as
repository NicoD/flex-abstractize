package lib {
	
	[Abstract]
	public class ClassA {
		
		public function ClassA():void {
			abstractize(this);
		}
		
		[Abstract]
		public function f1():void {}
		
	}
}