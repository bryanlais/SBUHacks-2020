import java.util.HashSet;

abstract class Scene {
  //Map type to GameObject Indexes. Allows for O(1) Search by Tag, Addition, Removal
  HashMap<tag,HashSet<GameObject>> objectMap;
  HashSet<GameObject> objects;
  //to be destroyed/created
  private LinkedList<GameObject> tbd,tbc;
  public Scene() {
    objects = new HashSet<GameObject>();
    objectMap = new HashMap<tag,HashSet<GameObject>>();
    tbd = new LinkedList<GameObject>();
    tbc = new LinkedList<GameObject>();
    init();
  }
  void init() {
  }
  void render(){
    for (GameObject obj : objects) {
      obj.render();
    }
  }
  int update() {
    int status = 0;
    //remove old objects that were requested to be removed
    while (!tbd.isEmpty()) {
      GameObject tmp = tbd.remove();
      objects.remove(tmp);
      //ArrayList<tag> types = tmp.getTags();
      for(tag i: tmp.getTags())objectMap.get(i).remove(tmp);
    }
    //add new objects requested to be added
    while (!tbc.isEmpty()) {
      GameObject tmp = tbc.remove();
      objects.add(tmp);
      for(tag i: tmp.getTags()){
        if(!objectMap.containsKey(i)){
          objectMap.put(i,new HashSet<GameObject>());
        }
        objectMap.get(i).add(tmp);
      }
    }
    //update objects
    for(GameObject obj:objects){
      status = obj.update();
      //if error, return. In the future but status handling to a different function but whatever
      if(status != 0){
        if(status == -1)return status;
        int temp = handleStatus(status);
        if(temp != 0)return temp;
      } 
    }
    return status;
  }
  protected abstract int handleStatus(int status);
  public HashMap<tag,HashSet<GameObject>> getObj(tag[] tags){
    HashMap<tag,HashSet<GameObject>> out = new HashMap<tag,HashSet<GameObject>>();
    for(tag i:tags){
      out.put(i,objectMap.get(i));
    }
    return out;
  }
  public void addObj(GameObject obj) {
    tbc.add(obj);
  }
  public void remObj(GameObject obj) {
    tbd.add(obj);
  }
  public void exit() {
  }
}