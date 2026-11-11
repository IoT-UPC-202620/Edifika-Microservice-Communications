package com.edifika.communication.communication.interfaces.rest.transform;

import com.edifika.communication.communication.domain.model.entities.AnnouncementRead;
import com.edifika.communication.communication.interfaces.rest.resources.AnnouncementReadResource;

public class AnnouncementReadResourceFromEntityAssembler {

    public static AnnouncementReadResource toResourceFromEntity(AnnouncementRead entity) {
        return new AnnouncementReadResource(
                entity.getId(),
                entity.getAnnouncementId(),
                entity.getUserId(),
                entity.getReadAt()
        );
    }
}
