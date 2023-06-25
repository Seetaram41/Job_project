/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JavaClasses;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegisterFilterClass {

    private final Pattern name;
    private final Pattern email;
    private final Pattern number;
    private final Pattern dob;
    private final Pattern pass;

    private Matcher matcher;

    private static final String NAME_PATTERN = "^[a-z A-Z]{3,30}$";
    private static final String EMAIL_PATTERN = "^([a-zA-Z0-9])(([a-zA-Z0-9])*([\\._\\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\\-])+(\\.))+([a-zA-Z]{2,4})+$";
    private static final String NUMBER_PATTERN = "^[0-9]{10}$";
    private static final String DOB_PATTERN = "^(0?[1-9]|[12][0-9]|3[01])[\\/\\-](0?[1-9]|1[012])[\\/\\-]\\d{4}$";
    private static final String PASS_PATTERN = "^[a-zA-Z0-9@]{6,100}";

    public RegisterFilterClass() {
        name = Pattern.compile(NAME_PATTERN);
        email = Pattern.compile(EMAIL_PATTERN);
        number = Pattern.compile(NUMBER_PATTERN);
        dob = Pattern.compile(DOB_PATTERN);
        pass = Pattern.compile(PASS_PATTERN);
    }

    public boolean nameValidate(final String name1) {
        matcher = name.matcher(name1);
        return matcher.matches();
    }

    public boolean emailValidate(final String email1) {
        matcher = email.matcher(email1);
        return matcher.matches();
    }

    public boolean numberValidate(final String number1) {
        matcher = number.matcher(number1);
        return matcher.matches();
    }

    public boolean dobValidate(final String dob1) {
        matcher = dob.matcher(dob1);
        return matcher.matches();
    }

    public boolean passValidate(final String pass1) {
        matcher = pass.matcher(pass1);
        return matcher.matches();
    }

}
