!test_agent.

+!test_agent : true <-
    .wait(1000);
    println("Before creating the first workspace");
    createWorkspace("firstWorkspace");
    // !print_root_workspace_state("firstWorkspace");
    println("After creating the first workspace, before creating the second and only then joining the first");
    createWorkspace("secondWorkspace");
    // !print_root_workspace_state("secondWorkspace");
    joinWorkspace("firstWorkspace", FirstWsp);
    println("After joining the first workspace, before creating the third workspace");
    createWorkspace("thirdWorkspace");
    // !print_workspace_state("firstWorkspace", "thirdWorkspace");
    println("After creating the third workspace, before joining it");
    joinWorkspace("thirdWorkspace", ThirdWsp);
    println("After joining the third workspace, before quitting it");
    quitWorkspace(ThirdWsp);
    println("After quitting the third workspace, before quitting the first and then joining the second");
    quitWorkspace(FirstWsp);
    joinWorkspace("secondWorkspace", SndWsp);
    println("After joining the second workspace, before quitting it").
    quitWorkspace(SndWsp).

+!print_workspace_state(ParentWspName, ChildWspName) : true <-
    cartago.invoke_obj("cartago.CartagoEnvironment", getInstance, EnvInstance);
    cartago.invoke_obj(EnvInstance, getRootWSP, RootWsp);
    cartago.invoke_obj(RootWsp, getWorkspace, RootWspObj);
    cartago.invoke_obj(RootWspObj, getChildWSP(ParentWspObj), OptParentWsp);
    cartago.invoke_obj(OptParentWsp, get, ParentWsp);
    cartago.invoke_obj(ParentWsp, getChildWSP(ChildWspName), OptChildWsp);
    cartago.invoke_obj(OptChildWsp, get, ChildWsp);
    cartago.invoke_obj(ChildWsp, getId, ChildWspId);
    println(ChildWspId).

+!print_root_workspace_state(ChildWspName) : true <-
    cartago.invoke_obj("cartago.CartagoEnvironment", getInstance, EnvInstance);
    cartago.invoke_obj(EnvInstance, getRootWSP, ParentWsp);
    cartago.invoke_obj(ParentWsp, getWorkspace, ParentWspObj);
    cartago.invoke_obj(ParentWspObj, getChildWSP(ChildWspName), OptChildWsp);
    cartago.invoke_obj(OptChildWsp, get, ChildWsp);
    cartago.invoke_obj(ChildWsp, getId, ChildWspId);
    println(ChildWspId).

+joinedWsp(WspId, WspName, NodeId) : true <-
    println("The agent joined the workspace ", WspName, " with id ", WspId, " and on node with id ", NodeId).

-joinedWsp(WspId, WspName, NodeId) : true <-
    println("The agent left the workspace ", WspName, " with id ", WspId, " and on node with id ", NodeId).

{ include("$jacamoJar/templates/common-cartago.asl") }
