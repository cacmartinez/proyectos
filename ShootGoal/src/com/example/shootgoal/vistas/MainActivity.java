package com.example.shootgoal.vistas;



<<<<<<< HEAD
import java.io.IOException;

import java.io.InputStream;

import android.R;
=======
>>>>>>> 9bde96e4774a1e51ba72338eb58fce13f16f0b38
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.WindowManager;

<<<<<<< HEAD

=======
import com.example.shootgoal.R;
>>>>>>> 9bde96e4774a1e51ba72338eb58fce13f16f0b38
import com.example.shootgoal.controladores.ControladorMenu;

public class MainActivity extends Activity{

	int vista = 0; //vista inicial 


	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		//setContentView(R.layout.activity_main);
		setContentView(R.layout.activity_main);
		getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
		Intent launchGame = new Intent(this,ControladorMenu.class);
		startActivity(launchGame);

	}


		


}
