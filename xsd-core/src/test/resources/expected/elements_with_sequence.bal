public type Person record {
    string name;
    string address;
};

public type person record {
    Person \#content;
};
