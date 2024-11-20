public type Add record {
    int intA;
    int intB;
};

public type AddResponse record {
    int AddResult;
};

public type Subtract record {
    int intA;
    int intB;
};

public type SubtractResponse record {
    int SubtractResult;
};

public type Multiply record {
    int intA;
    int intB;
};

public type MultiplyResponse record {
    int MultiplyResult;
};

public type Divide record {
    int intA;
    int intB;
};

public type DivideResponse record {
    int DivideResult?;
};
