package tests {

	import org.flexunit.Assert;
	
	public class TestAbstractize { 
		
		[Test(expects="Error", description="abstract class instantiation")]
		public function abstractInstanciation():void {
			new ClassA();
		}
		
		
		[Test(description="concrete valid class instantiation")]
		public function allIsOk():void {
			new ClassB();
			Assert.assertTrue(true);
		}
		
		[Test(expects="Error", description="concrete class instantiation with missing abstract method override")]
		public function abstractMethodNotOverriden():void {
			new ClassC();
		}
		
		[Test(description="concrete valid class instantiation, level-2 in hierarchy")]
		public function abstractMethodOverriden():void {
			new ClassD();
			Assert.assertTrue(true);
		}
		
		[Test(description="mixing abstract / concrete / abstract / concrete instanciation")]
		public function mixAbstractConcrete():void {
			new ClassF();
			Assert.assertTrue(true);
		}
	}
}