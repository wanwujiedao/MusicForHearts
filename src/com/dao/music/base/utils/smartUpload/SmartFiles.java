//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.dao.music.base.utils.smartUpload;

import com.dao.music.base.utils.smartUpload.SmartFile;
import java.io.IOException;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Hashtable;

public class SmartFiles {
    private Hashtable m_files = new Hashtable();
    private int m_counter = 0;

    SmartFiles() {
    }

    protected void addFile(SmartFile file) {
        if(file == null) {
            throw new IllegalArgumentException("newFile cannot be null.");
        } else {
            this.m_files.put(new Integer(this.m_counter), file);
            ++this.m_counter;
        }
    }

    public SmartFile getFile(int i) {
        if(i < 0) {
            throw new IllegalArgumentException("File\'s index cannot be a negative value (1210).");
        } else {
            SmartFile file = (SmartFile)this.m_files.get(new Integer(i));
            if(file == null) {
                throw new IllegalArgumentException("Files\' name is invalid or does not exist (1205).");
            } else {
                return file;
            }
        }
    }

    public int getCount() {
        return this.m_counter;
    }

    public long getSize() throws IOException {
        long l = 0L;

        for(int i = 0; i < this.m_counter; ++i) {
            l += (long)this.getFile(i).getSize();
        }

        return l;
    }

    public Collection getCollection() {
        return this.m_files.values();
    }

    public Enumeration getEnumeration() {
        return this.m_files.elements();
    }
}
