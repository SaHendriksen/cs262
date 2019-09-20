package edu.calvin.cs262.srh34;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

/**
 * @author      Sarah Hendriksen srh34@students.calvin.edu
 * @version     1.0
 */
public class MainActivity extends AppCompatActivity {

    private int mCount = 0;
    private TextView mShowCount;

    /**
     * Creates instance of Main Activity
     * <p>
     * Sets the start count to be 0
     * @param savedInstanceState Bundle         (3)
     */
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mShowCount = (TextView) findViewById(R.id.show_count);
    }


    /**
     * Shows a toast at the bottom of the screen to the user
     * @param view View, where the toast will be displayed
     */
    public void showToast(View view) {
        Toast toast = Toast.makeText(this, R.string.toast_message,
                Toast.LENGTH_SHORT);
        toast.show();
    }

    /**
     * Increments the value of the count by 1
     * @param view View, where the toast will be displayed
     */
    public void countUp(View view) {
        mCount++;
        if (mShowCount != null)
            mShowCount.setText(Integer.toString(mCount));
    }


}
